```ruby
  class Article < ActiveRecord::Base
    recognizable by: :name
  end

  article = Article.new(name: 'Falling oil prices: Who are the winners and losers?')
  article.to_name         # => Article «Falling oil prices: Who are the winners and losers?»
  article.to_name(:short) # => Falling oil prices: Who are the winners and losers?
```

```yml
ru:
  activerecord:
    models:
      article: 'Статья'
```

```ruby
  article.to_name         # => Статья «Falling oil prices: Who are the winners and losers?»
  article.to_name(:short) # => Falling oil prices: Who are the winners and losers?
```

## Gemfile
```ruby
gem 'activerecord-recognizable', github: 'yivo/activerecord-recognizable'
```