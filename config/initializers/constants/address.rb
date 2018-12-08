# frozen_string_literal: true

module AddressConst
  BILLING = 'billing_address'
  SHIPPING = 'shipping_address'
end

module RegexAddress
  TEXT_FIELDS = /\A[a-zA-Z]+\z/
  PHONE = /\A\+\d{10,14}\z/
  ZIP = /\A((\d)[-]?){1,10}\z/
  ADDRESS = /\A(([a-zA-Z0-9]+)([-\,\s]?)([a-zA-Z0-9]+))+\z/
  MAX_LENGTH = 50
end
