class User < ActiveRecord::Base
  belongs_to :group
  validates :name, :presence => true
  
  attr_accessible :name, :email, :email, 
    :sex, :country, :area, :address1, 
    :address2, :phone, :hits, :catches, :balls, :group
  
  before_save do
    self[:catches] = catches.map do |catch|
      catch.to_i
    end
    self[:hits] = hits.map do |hit|
      hit.to_i
    end
    self.balls = balls.map do |ball|
      h = {}
      [ :change, :level ].each do |key|
        h[key] = ball.send(key).to_i
      end
      h
    end
  end
  
  def balls
    case self[:balls]
    when String
      YAML.load(self[:balls]).map { |e| Ball.new(e) }
    when Array
      self[:balls].map { |e| e.kind_of?(Ball) ? e : Ball.new(e) }
    end
  end
  
  def balls=(value)
    case value
    when Hash
      self[:balls] = value.keys.sort.map do |key|
        h = {}
        value[key].each do |k, v|
          h[k.to_sym] = v
        end
        h
      end
    when Array
      self[:balls] = value
    end
  end
  
  def catches
    case self[:catches]
    when String
      YAML.load(self[:catches]).map { |e| Catch.new(e) }
    when Array
      self[:catches].map { |e| e.kind_of?(Catch) ? e : Catch.new(e) }
    else
      (0..5).map { |n| Catch.new(n * 100) }
    end
  end
  
  def catches=(hash_or_array)
    case hash_or_array
    when Hash
      self[:catches] = hash_or_array.keys.sort.map do |key|
        Catch.new(hash_or_array[key])
      end
    when Array
      self[:catches] = hash_or_array.map { |e| Catch.new(e) }
    end
  end
  
  def hits
    case self[:hits]
    when String
      YAML.load(self[:hits]).map { |e| Hit.new(e) }
    when Array
      self[:hits].map { |e| e.kind_of?(Hit) ? e : Hit.new(e) }
    else
      (0..2).map { |n| Hit.new(n * 100) }
    end
  end
  
  def catches=(hash_or_array)
    case hash_or_array
    when Hash
      self[:hits] = hash_or_array.keys.sort.map do |key|
        Hit.new(hash_or_array[key])
      end
    when Array
      self[:hits] = hash_or_array.map { |e| Hit.new(e) }
    end
  end
  
  def to_xml(options = {})
    options[:indent] ||= 2
    xml = options[:builder] ||= ::Builder::XmlMarkup.new(:indent => options[:indent])
    xml.user do
      xml.id id
      xml.name name
      xml.sex sex
      xml.country country
      xml.area area
      xml.address1 address1
      xml.address2 address2
      xml.phone phone
      xml.balls do
        balls.each do |b|
          xml.ball do
            xml.change b.change
            xml.level b.level
          end
        end
      end
      xml.hits do
        hits.each do |h|
          xml.hits h.to_i
        end
      end
      xml.catches do
        catches.each do |c|
          xml.catches c.to_i
        end
      end
    end
  end
end
