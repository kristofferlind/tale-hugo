function onClickIntent(element, hoverTime, callback) {
  let timer;

  function disable() {
    element.removeEventListener('mouseover', start);
    element.removeEventListener('mouseleave', cancel);
  }

  function fire() {
    callback(element);
    disable();
  }

  function cancel() {
    clearTimeout(timer);
    timer = null;
  }

  function start() {
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
    const href = element.getAttribute('href')
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

  const isInternalLink = element.href.includes(window.location.host);
  const currentPage = window.location.origin + window.location.pathname;
  const cleanLink = element.href.replace(/#[a-zA-Z0-9_-]*/, '');
  const isOtherPage = currentPage != cleanLink;

  if (isInternalLink && isOtherPage) {
    onClickIntent(element, 150, createPrefetchHint);
    onClickIntent(element, 1000, createPrerenderHint);
  }
}

document.querySelectorAll('a').forEach(setup);
