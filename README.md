# Course Enrollement

## Running the app locally
#### Dependencies
* Ruby 2.3.0

Use bundler to install the project gems:

```
bundle install
```

Create and setup local database:

```bash
bundle exec rake db:create
bundle exec rake db:migrate

To run the application server:

```bash
bundle exec rails s
```

To run the rspecs:

```bash
bundle exec rspec spec/controllers/
```


## Development workflow
Given 2 models - Course & Tutor
-A course can have many tutors.
-Tutor can teach one course only.

- API'S details:

1. POST   /courses

```payload:
{ "course":
  {"name": "physics", "tutors_attributes":
    [{"name": "johsnon"}, {"name": "thomas"}]
  }
}
```

2. GET /courses
