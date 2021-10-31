function onClickIntent(element, hoverTime, callback) {
  let isCancelled, timer;

  function disable() {
    element.removeEventListener('mouseover', start);
    element.removeEventListener('mouseleave', cancel);
  }

  function fire() {
    if (!isCancelled) {
      callback(element);
      disable();
    }
  }

  function cancel() {
    clearTimeout(timer);
    timer = null;
  }

  function start() {
    isCancelled = false;
    timer = setTimeout(fire, hoverTime);
  }

  element.addEventListener('mouseover', start);
  element.addEventListener('mouseleave', cancel);
}

let hasPrerenderHint = false;
let existingHints = [];

function setup(element) {
  let hint;

  function createPrefetchHint() {
    let href = element.getAttribute('href')
    if (!existingHints.includes(href)) {
      hint = document.createElement('link');
      hint.setAttribute('rel', 'prefetch');
      hint.setAttribute('href', href);
      document.head.appendChild(hint);
      existingHints.push(href);
    }
  }

  function createPrerenderHint() {
    if (!hasPrerenderHint) {
      hint.setAttribute('rel', 'prerender');
      hasPrerenderHint = true;
    }
  }

  let isInternalLink = element.href.includes(window.location.host);

  if (isInternalLink) {
    onClickIntent(element, 150, createPrefetchHint);
    onClickIntent(element, 1000, createPrerenderHint);
  }
}

document.querySelectorAll('a').forEach(setup);
