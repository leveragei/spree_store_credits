module Spree
  class Promotion::Actions::GiveStoreCredit < PromotionAction
    preference :amount, :decimal, :default => 0.0

    def perform(payload = {})
      result = false
      user = lookup_user(payload)
      if user.present?
        give_store_credit(user)
        result = true
      end
      result
    end

    def lookup_user(options)
      user = options[:user]
      unless user
        if options[:order]
          user = ::Spree::User.find_by_email(options[:order].email)
        end
      end
      user
    end

    def give_store_credit(user)
      user.store_credits.create(:amount => preferred_amount, :remaining_amount => preferred_amount,
                                :reason => credit_reason)
    end

    def credit_reason
      "#{Spree.t(:promotion)} #{promotion.name}"
    end
  end
end
