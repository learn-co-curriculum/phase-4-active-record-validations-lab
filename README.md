# Active Record Validations Lab

## Learning Goals

- Write basic validations using Active Record helpers
- Write custom validations

## Introduction

This project has starter code for a couple of models, `Author` and `Post`. To
get set up, run:

```console
$ bundle install
$ rails db:migrate
```

Then run `learn test` to run the tests. We'll be focusing solely on the model
files for this lab, so there's no need to run `rails s` or view anything in the
browser.

## Basic Validations

Add validations to these models such that...

1. All authors have a name
2. No two authors have the same name
3. Author phone numbers are exactly ten digits
4. All posts have a title
5. Post content is at least 250 characters long
6. Post summary is a maximum of 250 characters
7. Post category is either `Fiction` or `Non-Fiction`. This step requires an
   `inclusion` validator, which was not outlined in the lesson. You'll need to
   refer to the [Rails guide][active record validations] to look up how to use
   it.

## Custom Validations

Finally, add a custom validator to the `Post` model that ensures the title is
sufficiently clickbait-y. The validator should add a validation error if the
title does not contain:

- "Won't Believe"
- "Secret"
- "Top [number]"
- "Guess"

Use the [Custom methods][custom methods] style of validator found in the Rails
documentation.

## Resources

- [Active Record Validations][active record validations]
- [Custom Methods][custom methods]

[active record validations]: https://guides.rubyonrails.org/active_record_validations.html
[custom methods]: https://guides.rubyonrails.org/active_record_validations.html#custom-methods
