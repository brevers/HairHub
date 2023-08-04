# HairHub
![0098](https://github.com/brevers/HairHub/assets/45858960/2fe6f662-2d0a-4959-913e-2cb3fce91b6e)
HairHub is a [Rails](https://rubyonrails.org) application which works as central source of information for people searching for information online about hair transplants.

This website offers users a speedy and reliable platform to discover customized treatment options. It includes a seamless subscription tool for agencies, utilizing Stripe Subscription Payment for effortless integration. The website also leverages Twilio Whatsapp for improved communication between users and agencies. With built-in Google Maps API, users can easily find nearby agencies, and agencies have the option to claim their listing by subscribing and making a payment to feature on our website.

## Table of Contents
- [Features](#features)
- [Demo](#demo)
- [Getting Started](#getting-started)
- [Installation](#installation)
- [Testing](#testing)
- [Gems Used](#gems-used)
- [Contributing](#contributing)
- [License](#license)

## Features
> **User Authentication:** Allow users and agencies to sign up, log in, and manage their accounts securely.

> **Agencies Subscription Tool:** Agencies can seamlessly integrate with the platform using the Stripe Subscription Payment system.

> **Real-time Communication:** Twilio Whatsapp integration enables smooth and efficient communication between users and agencies.

> **Geolocation Search:** Utilize Google Maps API to allow users to search for nearby agencies.

> **Agency Claiming:** Agencies have the option to claim their listing on the website by subscribing and making a payment.

> **Responsive Design:** Ensure a great user experience across different devices with a responsive and mobile-friendly design.

> **Easy Setup:** Provide simple and clear instructions for users and agencies to get started with the platform.

> **Continuous Integration:** Implement continuous integration and automated testing to maintain code quality.

## Demo

To explore the website from an agency's perspective, you can use the following credentials:
```
user: grace@example.com
pass: 123123!
```
1. Navigate to the login page.
2. Enter the provided email and password.
3. Click the "Login" button.
4. Once logged in, you will have access to the agency dashboard, where you can manage agency name, subscriptions, and messages.

To experience the website as a user, you can use the following credentials:
```
user: John@example.com
pass: 123123!
```
1. Go to the login page.
2. Enter the provided email and password.
3. Click the "Login" button.
4. After logging in, you will be directed to the user features, where you can search for agencies nearby, send messages, and find different offers.

## Getting Started

To get a local copy of the project up and running, follow these steps:

## Installation

1. Clone the repository to your local machine:

bash
git clone https://github.com/brevers/HairHub.git
cd HairHub



## Gems Used

**Here are some of the key gems used in the project:**

- [RSpec](https://rspec.info/): A powerful testing framework for writing unit and integration tests.

- [FactoryBot](https://github.com/thoughtbot/factory_bot): A library for defining and creating test data in a concise and readable manner.

- [Capybara](https://github.com/teamcapybara/capybara): An acceptance test framework for simulating user interactions with the web application.

- [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers): Provides easy and expressive RSpec matchers for validating model associations and validations.

- [RuboCop](https://github.com/rubocop/rubocop): A code linter that ensures consistent and readable coding styles throughout the project.

- [Devise](https://github.com/heartcombo/devise): A flexible authentication solution for Rails applications, used for user authentication in HairHub.

- [Twilio-Ruby](https://github.com/twilio/twilio-ruby): The Twilio API wrapper gem, used to integrate Twilio WhatsApp functionality for smooth communication between users and agencies.

- [Stripe](https://github.com/stripe/stripe-ruby): The Stripe API wrapper gem, utilized for handling subscription payments and integrating Stripe's subscription payment system.
- [Geocoder](https://github.com/alexreisner/geocoder): A gem that simplifies geocoding and reverse geocoding, utilized for the Google Maps API integration in HairHub.

- [Faker](https://github.com/faker-ruby/faker): A gem that generates random data, used to create realistic test data in the development and testing environment.

- [SimpleCov](https://github.com/simplecov-ruby/simplecov): A code coverage analysis tool for tracking test coverage and ensuring thorough testing.

## Contrubuting
Contributions to HairHub are always welcome! If you find a bug or have a feature request, please open an issue on the repository. If you'd like to contribute code, please fork the repository and submit a pull request.

## License
HairHub is released under the MIT License.
