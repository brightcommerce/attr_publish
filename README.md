# AttrPublish

Provides scopes for finding published and unpublished items, and (for date/datetime published columns) for returning recent or upcoming items. Also provides a set of convenient instance methods for publishing and unpublishing a record.

Allows a given boolean, date, or datetime column to indicate whether a model object is published. A boolean published column is just an on/off flag. A date/datetime column requires the value of published column to be before "current" for the object to be published.

## Installation

To install add the line to your Gemfile:

``` ruby
gem 'attr_publish'
```

And `bundle install`.

## How To Use

To add AttrPublish to a model, include the concern:

``` ruby
class Post < ActiveRecord::Base
  include AttrPublish

  attr_publish
end
```

This will automatically default to look for a column named ':published'.

To autoload AttrPublish for all models, add the following to an initializer:

``` ruby
require 'attr_publish/active_record'
```

You then don't need to `include AttrPublish` in any model, but you still need to add the `attr_publish` class method.

### Class Methods

AttrPublish adds the following scopes to your model (using the previous example model `Post`):

``` ruby
Post.published
Post.unpublished
```

By default these scopes uses the current date or current time to limit the query. However, you can pass any date or datetime to these scopes to limit the records it returns:

``` ruby
Post.published(DateTime.yesterday)
```

If the published column is of type `:date` or `:datetime` the following additional scopes are provided:

``` ruby
Post.recent
Post.upcoming
```

By default these scopes return all matching records. You can limit the number of records returned by passing a number to the scope:

``` ruby
Post.recent(10) # returns the 10 most recent published posts (ordered by date or datetime)
Post.upcoming(3) # returns 3 next unpublished posts (ordered by date or datetime)

### Instance Methods

AttrPublish automatically provides the following class instance methods:

- `published?`
- `unpublished?`
- `publish`
- `publish!`
- `unpublish`
- `unpublish!`

If the column type is specified as a Date or Time, you can pass a datetime parameter to the `publish` and `publish!` instance methods. `publish` and `unpublish` methods will change the instance's publish value, but won't save the object. Using the `publish!` and `unpublish!` bang methods will call save (commit) after changing the value.

### Setup

Add the model attribute you want to use with AttrPublish in your migration:

``` ruby
class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |table|
      table.column :published, :datetime
      table.timestamps
    end
  end
end
```

You can change the column used by AttrPublish by adding the column name to the `attr_publish` class method:

``` ruby
class Post < ApplicationRecord
  include AttrPublish

  attr_publish :published_on
end
```

## Dependencies

AttrPublish gem has the following runtime dependencies:
- activerecord >= 5.1.4
- activesupport >= 5.1.4

## Compatibility

Tested with MRI 2.4.2 against Rails 5.2.2.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credit

This gem was written and is maintained by [Jurgen Jocubeit](https://github.com/JurgenJocubeit), CEO and President Brightcommerce, Inc.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Copyright

Copyright 2018 Brightcommerce, Inc.
