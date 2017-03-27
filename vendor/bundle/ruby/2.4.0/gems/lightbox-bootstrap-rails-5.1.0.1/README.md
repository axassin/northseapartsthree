# Lightbox for Bootstrap 4

This gem was built for the use of 'Lightbox for Bootstrap 4' as Rails assets pipeline and you can look for the detailed documents at http://ashleydw.github.io/lightbox/

Updated using Bootstrap 4 alpha 6 version

[![Gem Version](https://badge.fury.io/rb/lightbox-bootstrap-rails.svg)](http://badge.fury.io/rb/lightbox-bootstrap-rails)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lightbox-bootstrap-rails', '5.1.0.1'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install lightbox-bootstrap-rails
```

## Usage

in assets/javascripts/application.js

``` javascript
//= ...
//= require lightbox-bootstrap
//= ...
```

in assets/stylesheets/application.scss

``` css
...
@import "bootstrap";
@import "lightbox-bootstrap";
...
```

or in assets/stylesheets/application.css

``` css
/*...
*= require lightbox-bootstrap
*= require ...
*/
```

Finally, you should add `assets/javascripts/lightbox_bootstraped.coffee` as follows:

``` coffee
$(document).delegate '*[data-toggle="lightbox"]', 'click', (event) ->
  event.preventDefault()
  $(this).ekkoLightbox()
  return
```

## Test Application

Among the gem sources, a test application is provided and there you can find how to code in the wild.

# Changelog

  - v 3.3.0.0 : initially created.
  - v 3.3.0.1 : deployed to Rubygems.org
  - v 3.3.0.2 : modified @import stylesheet syntax
  - v 3.3.0.3 : fixed typos in ekko-lightbox.min.js and ekko-lightbox.js ([lightbox v4.0.2](https://github.com/ashleydw/lightbox/tree/v4.0.2) for Boostrap 3).
  - v 5.0.0.0 : updated with [lightbox v5.0.0](https://github.com/ashleydw/lightbox/tree/v5.0.0) for Boostrap 4 alpha 5
  - v 5.1.0.0 : updated with [lightbox v5.1.0](https://github.com/ashleydw/lightbox/tree/v5.1.0) for Boostrap 4 alpha 6
  - v 5.1.0.1 : fixed modal dialog alignments

## Contributing

1. Fork it ( https://github.com/[my-github-username]/lightbox-bootstrap-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
