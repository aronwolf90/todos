// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import { Application } from '@hotwired/stimulus'
import Dropdown from '@stimulus-components/dropdown'

const application = Application.start()
application.register('dropdown', Dropdown)

addEventListener("turbo:load", onAutofocusMoveCursorToEnd)
addEventListener("turbo:frame-load", onAutofocusMoveCursorToEnd)

function onAutofocusMoveCursorToEnd(event) {
  let autofocusElement = event.target.querySelector("[autofocus]")
  
  // HACK: there is a bug that causes that setSelectionRange
  // does not work on emails.
  if (autofocusElement && autofocusElement.type != "email") {
    const length = autofocusElement.value.length;
    autofocusElement.setSelectionRange(length, length);
  }
}
