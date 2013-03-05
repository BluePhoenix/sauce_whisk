# SauceWhisk

SauceWhisk provides an "ActiveRecord" style client for the [Sauce Labs](http://www.saucelabs.com) RESTful API.  If you're not using the [Sauce Gem](https://rubygems.org/gems/sauce) and you want a nice way to interact with our API, give this a try.

## Installation

Add this line to your application's Gemfile:

    gem 'sauce_whisk'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sauce_whisk

## Usage
    
### Marking a Job as Passed

    SauceWhisk::Jobs.pass_job job_id
    
### Marking a Job as Failed
   
    SauceWhisk::Jobs.fail_job job_id

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
