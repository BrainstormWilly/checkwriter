class Check < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  default_scope { order(date: :desc) }

  def pretty_amount
    return (amount.to_f.round(2) * 100).to_words(remove_hyphen: true).split.map(&:capitalize).join(" ") + " Cents" if amount < 1
    return amount.to_i.to_words(remove_hyphen: true).split.map(&:capitalize).join(" ") + " Dollars Exactly" if amount.round(2) == amount.to_i
    cents = (amount.round(2) - amount.floor).to_f * 100
    amount.floor.to_words(remove_hyphen: true).split.map(&:capitalize).join(" ") + " Dollars and " + cents.floor.to_words(remove_hyphen: true).split.map(&:capitalize).join(" ") + " Cents"
  end

  def decimal_amount
    "$#{number_with_precision(amount, precision: 2, delimiter: ",")}"
  end

end
