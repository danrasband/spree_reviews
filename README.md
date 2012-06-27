Reviews
=======

Straightforward review/rating facility

Installation
------------

1. Add `gem 'spree_reviews', :git => 'git://github.com/danrasband/spree_reviews'` to your Gemfile
2. Run `bundle install`
3. To copy and apply migrations run:

```bash
bundle exec rails g spree_reviews:install
```

Usage
-----

1. Action "submit" in "reviews" controller - goes to review entry form
2. Users must be logged in to submit a review
3. Administrator can edit and/or approve and/or delete reviews.

Copyright (c) 2012 [Dan Rasband], released under the MIT License
