class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if self.valid? && @status != "complete"
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    elsif sender.valid? != true || receiver.valid? != true
      @status = "rejected"
      p "Transaction rejected. Please check your account balance."
    end
  end
end
