# Simple log parser in Ruby
Not much in here, takes a log file and pints obut unique visits and page views.

# Usage

```sh
./parser.rb webserver.log

Unique visits:
/index 23 unique views
/home 23 unique views
/contact 23 unique views
/help_page/1 23 unique views
/about/2 22 unique views
/about 21 unique views

Pageviews:
/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits
```

# Troubleshooting
The `parser.rb` file needs to be executable:

```sh
chmod +x parser.rb
```
