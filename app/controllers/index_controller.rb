class IndexController < ApplicationController  
  def index
    # Homepage, no fetch required.
  end

  def calculate
    total_income = params[:income].to_i
  
    @breakdown = Hash.new
    @breakdown[:income] = total_income

    line_items = []
    tax_brackets = TAX_BRACKETS["NZ"]
    tax_brackets = tax_brackets.sort_by { |bracket| bracket["bracket_start"]}.reverse

    total_tax = 0
    income_running_val = total_income
    tax_brackets.each do |bracket|
      tax_rate = bracket["tax"].to_f
      bracket_start = bracket["bracket_start"]
      bracket_end = bracket["bracket_end"]

      next if bracket_start > income_running_val

      bracket_cuttof = [0, bracket_start - 1].max # ensure cutoff is never less than 0
      amount_in_bracket = income_running_val - bracket_cuttof
      tax_in_bracket = (tax_rate / 100 * amount_in_bracket)

      line_item = { "bracket_start" => bracket_start, "bracket_end" => bracket_end, "tax_rate" => tax_rate, "tax_in_bracket" => tax_in_bracket.round(2)}

      line_items = line_items.append(line_item)

      total_tax += tax_in_bracket
      income_running_val = bracket_start - 1
    end

    @breakdown[:total_tax] = total_tax.round(2)
    @breakdown[:line_items] = line_items

    render partial: "shared/tax_breakdown"
	end
end
