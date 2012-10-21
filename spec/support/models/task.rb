class Task
    attr_accessible :completed_at, :name, :description

    validates :name, :presence => true
    validates :description, :presence => true

    def done?
        self.completed_at ? true : false
    end
    def save?
        self.save
    end
end