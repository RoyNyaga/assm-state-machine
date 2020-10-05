class Invoice
  include AASM

  attr_reader :name

  aasm do
    after_all_transitions :log_status_change

    state :draft, initial: true
    state :unpaid
    state :sent
    state :paid
    state :archived

    event :draft do
      transitions from: :unpaid, to: :draft
    end

    event :confirm do
      transitions from: :draft, to: :unpaid
    end

    event :sent, after: :send_invoice do
      transitions from: :unpaid, to: :sent
    end

    event :pay do
      transitions from: :sent, to: :paid
    end

    event :archive do
      transitions from: [:upaid, :paid], to: :archived
    end
  end

  def initialize(name)
    @name = name
  end
end