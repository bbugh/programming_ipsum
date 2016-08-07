# ProgrammingIpsum

Generate fantastic programming advice using a gem. Useful if you want to increase your score on Stack Overflow, make money as a technical consultant, or sound smart in a job interview.

## Example

If someone asks you a question about why their code doesn't work, you could respond with:

> You haven't iterated a parameter, so your element is just initializing forever. Check the documentation on processes, and see if there's not a dependency or list you can use to have the instance initialize it automatically. Your loops didn't have return types for the references of the index's length.

Perhaps someone's boolean dependencies aren't looping and they want to know why:

> Since you're using Rails, return types are overkill here. If you switch to JavaScript, you won't keep seeing these out of scope return types. You could initialize it as a string, but you'd need to return an instance also or your results will be wrong. If it's not exiting your closures, something is very wrong... It loops each reference and exits a boolean dependency, and then the dependency is handed to the next dependency.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'programming_ipsum'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install programming_ipsum

## Usage

To generate some helpful advice in your application, use `sequence` like so:

```ruby
advice = ProgrammingIpsum::AdviceIpsum.new
output = advice.sequence(5)
```

To view all possible generated phrases (intended for debugging or satisfying curious cats):

```ruby
advice = ProgrammingIpsum::AdviceIpsum.new
output = advice.all_phrases
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment with bad advice to your heart's content.

To install the development version of this gem onto your local machine, run `bundle exec rake install`. At this point you may begin celebrating your success by cheering, dancing, or some other creative expression.

## Contributing

Bug reports, pull requests, and compliments are welcome on GitHub at https://github.com/bbugh/programming_ipsum.

Expanded phrases and contexts can be suggested as well, see `lib/programming_ipsum/advice_ipsum.rb` for the format and create a pull request. If I like them, I'll accept them.

If you're new to open source contribution, [this Beginner's Guide to Contributing to Open Source Projects](https://blog.newrelic.com/2014/05/05/open-source_gettingstarted/) is a great resource.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT). That means you can use it however you want to, but you have to give me credit. That's just polite.
