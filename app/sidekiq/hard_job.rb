class HardJob
  include Sidekiq::Job

  def perform(*args)
    puts "This is HardJob run from sidekiq"
    random = rand(1..99999);
    Post.new(
      title: "Good new #{random}",
      content: "Content of #{random}"
    ).save!
  end
end
