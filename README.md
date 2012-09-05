# HTML Attributes

HTML Attributes provide helper methods to convert arrays and hashes to valid html attributes. If this gem is included in a Ruby on Rails project it will extend the view helpers to pass arrays or hashes for class or style attributes.

## Installation

Add this line to your application's Gemfile:

    gem "html_attributes"

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install html_attributes

## Usage

    { :first => true, :second => false, :third => true }.to_class_attr
    => "first third"

    [:first, :second, :third].to_class_attr
    => "first second third"

    { :margin => { :top => "10px", :left => "5px" }, :font_size => "12pt" }.to_style_attr
    => "margin-top: 10px; margin-left: 5px; font-size: 12pt;"

    ["padding-top: 8px", "padding-right: 15px", "font-size: 12pt"].to_style_attr
    => "padding-top: 8px; padding-right: 15px; font-size: 12pt;"

If gem is included in a Ruby on Rails project the view helpers are extended:

    content_tag(:div, :class => { :first => true, :second => false, :third => true }) { ... }
    => <div class="first third">...</div>

    content_tag(:div, :style => { :margin => { :top => "10px", :left => "5px" }, :font_size => "12pt" })  { ... }
    => <div style="margin-top: 10px; margin-left: 5px; font-size: 12pt;">...</div>

## Extension

To support additional conversions of arrays, hashed, or any other objects to HTML attributes when using the Rails view helpers a `#to_#{attribute_name}_attr` method can be implemented.

    class MyImageClass

      # initializer ...

      def to_width_attr
        @width
      end

      def to_height_attr
        @height
      end

    end

    img = MyImageClass.new
    tag(:img, :width => img, :height => img)
    => <img width="30" height="20" />

## Test

Checkout and cd into the repository and then run:

    $ bundle install
    $ bundle exec rspec spec

Copyright (c) 2012 Jan Sebastian Siwy, Martin Spickermann, Henning Staib, released under the MIT license
