# Fibonacci As A Service

This application demonstrates a RESTful service that will return the results of
a Fibonacci sequence calculation. There is a single resource available:
`GET /sequence/:number`.

## Getting Started

The application requires a Ruby environment along with the Rubygems/Bundler
combination of package management.

Follow these instructions to install Ruby:
https://www.ruby-lang.org/en/documentation/installation/

Follow these instructions to install Bundler:
http://bundler.io/#getting-started

Once that is complete, clone the repository and from the root directory of the
project, run the following commands:

```text
bundle install
bundle exec foreman start
```

`Ctrl+c` can be used to quit a running application.

## Example Usage

The application requires a non-zero, positive, integer to generate a sequence.
The sequence is returned under the "sequence" key of the response body.

```text
$> curl -D - localhost:5000/sequence/3

HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 20
X-Content-Type-Options: nosniff
Server: WEBrick/1.3.1 (Ruby/2.2.3/2015-08-18)
Date: Wed, 23 Dec 2015 18:49:59 GMT
Connection: Keep-Alive

{"sequence":[0,1,1]}
```

If an invalid number is passed, the API will respond w/ a 422 status and a descriptive error message.

```text
$> curl -D - localhost:5000/sequence/-1.2

HTTP/1.1 422 Unprocessable Entity
Content-Type: application/json
Content-Length: 37
X-Content-Type-Options: nosniff
Server: WEBrick/1.3.1 (Ruby/2.2.3/2015-08-18)
Date: Wed, 23 Dec 2015 18:48:36 GMT
Connection: Keep-Alive

{"error":"number must be an integer"}
```

## Testing

This application uses RSpec. To run the specs:

```text
bundle exec rake
```

(c) 2015 Josh Schairbaum. This code is distributed under the MIT license.
