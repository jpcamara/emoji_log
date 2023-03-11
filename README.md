# EmojiLog

A LogSubscriber for Rails that modifies controller logs with emojis to represent performance (🐢, 🐇, 🚀) and http status codes (🧠, ✅, 🔁, ❌, 🔥, ❓).

Inspired by an episode of the Syntax podcast.

> I wrote this really nice little handy middleware... that analyzes all my requests as they go, just timing them - and based on how long the request takes it gives me different emoji. So if the request is really fast it's a 🚀, if it's kinda fast it's a 🐇, if it's slow it's a 🐢. ...In my console while I'm just browsing the site I can just see - and it has what type of request, what path it was too, and it's just like at a glance I can see - 'oh I'm in turtle time right now - these requests to this page are all slow for some reason let me take a look'
>
> Scott Tolinski
> Syntax Podcast, Episode 570 - https://syntax.fm/show/570/node-js-cjs-esm

## Usage

```rb
config.after_initialize do
  EmojiLog.slow = "🐢"
  EmojiLog.average = "🐇"
  EmojiLog.fast = "🚀"
  EmojiLog.slow_threshold = 1000
  EmojiLog.average_threshold = 500
  EmojiLog.fast_threshold = 150

  EmojiLog.info = "🧠"
  EmojiLog.success = "✅"
  EmojiLog.redirect = "🔁"
  EmojiLog.bad = "❌"
  EmojiLog.error = "🔥"
  EmojiLog.cancelled = "❓"
end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem "emoji_log"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install emoji_log
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
