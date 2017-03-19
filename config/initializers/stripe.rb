Rails.configuration.stripe = {
  :publishable_key => "pk_test_C8LhRd4jAWzHSUWbxmSt2q2w",
  :secret_key      => "sk_test_rNyrM2XrWpdxmNrOwzoWLPK9"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]