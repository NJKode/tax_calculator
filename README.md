# Tax Calculator

NZ Tax calculator built by Nathan Kennedy.

Built on Ubuntu 24.04 (Using WSL on Windows 10).

Ruby Version: `3.4.2`

Rails Version: `8.0.1`

First, clone this repository, then:
```
$ bundle install
```

Next, view the project locally:
```
$ bin/rails server
```

If using default configuration, you can then see this live at http://127.0.0.1:3000

---
### Overview

I created this using default configuration by running `rails new tax_calculator`. As a result, there is probably way too much scaffolding for this project.

The calculator is a simple form with one number input. When the 'Calculate' button is pressed, the tax breakdown will show immediately below.

After submitting the form, I didn't want the page to refresh or navigate to a different page.

In previous work, I would have solved this by making the GET request with AJAX and JQuery. However, installing JQuery seemed overkill for this project.

I opted to use Hotwire/Turbo streams to get this functionality instead. I hadn't used it before so I was keen to try it out, and it comes built-in to Rails now.

Using this package, Rails will intercept the request from the browser. Then, it will run the calculation using the endpoint in index_controller.rb. The returned tax breakdown is rendered in-place.

I used [Water.css](https://watercss.kognise.dev/) so that I wouldn't have to bother with styles for this small project.
