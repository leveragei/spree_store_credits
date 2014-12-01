module Spree
  class Promotion::Actions::GiveStoreCredit < PromotionAction
    preference :amount, :decimal, :default => 0.0

    def perform(payload = {})
      result = false
      order = payload[:order]

      if order
        user = lookup_user(order)
        if user.present?
          give_store_credit(user)
          create_adjustment(order)
          result = true
        end
      end

      result
    end

    def lookup_user(order)
      ::Spree::User.find_by_email(order.email)
    end

    def give_store_credit(user)
      user.store_credits.create(:amount => preferred_amount, :remaining_amount => preferred_amount,
                                :reason => credit_reason)
    end

    def credit_reason
      "#{Spree.t(:promotion)} #{promotion.name}"
    end

    def compute_amount(order)
      preferred_amount
    end

    private
    def create_adjustment(order)
      ::Spree::Adjustment.create!(
          amount: preferred_amount,
          order: order,
          adjustable: order,
          source: self,
          label: "#{Spree.t(:promotion)} (#{promotion.name})"
      )
    end
  end
end
