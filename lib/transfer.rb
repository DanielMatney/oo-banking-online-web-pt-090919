require 'pry'
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
    if self.valid? == true && @status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    end
    if sender.valid? == false || receiver.valid? == false
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    #binding.pry
  end
  
  def reverse_transfer
    if @status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
