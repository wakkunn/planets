module IntegrationTestHelper
  def debug
    save_and_open_page
  end

  def dump
    puts page.body
  end
end
