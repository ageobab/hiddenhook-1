Rails.configuration.stripe = {
  :publishable_key => STRIPE_KEY,
  :secret_key      => STRIPE_SECRET
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]