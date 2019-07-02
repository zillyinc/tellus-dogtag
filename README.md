# Tellus::Dogtag

Utilities for using Dogtag with ActiveRecord.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tellus-dogtag'
```

## Usage

Include the `HasDogtagId` concern with the relevant model classes or along with ApplicationRecord.

Specify the data types in an initializer like `config/initializers/tellus_dogtag.rb` with a hash like the following:

```ruby
Tellus::Dogtag::DataType.data_types = {
  'ModelName' => 0,
  'AnotherOne' => 1,
}.freeze
```
