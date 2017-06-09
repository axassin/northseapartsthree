class ExpenseEntryDecorator < ApplicationDecorator
  delegate_all

  def amount
    (object.amount_centavos.to_s + ' ' + object.amount_currency.to_s)
  end

  def ref
    object.reference_number.to_s
  end

  def exp_cat
    object.expense_category_summary
  end

  def req
    object.requesting_party_summary
  end

  def vendr
    object.vendor_summary
  end

end
