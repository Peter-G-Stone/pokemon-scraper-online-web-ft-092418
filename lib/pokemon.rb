class Pokemon

    @@all = []

    attr_accessor :id, :name, :type, :db, :hp

    def initialize (id = nil, name = nil, type = nil, db = nil)
        @id = id
        @name = name 
        @type = type
        @db = db
        @hp = hp
    end

    def self.save(tempname, temptype, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES(?, ?)

        SQL
        db.execute(sql, tempname, temptype)
    end

    def self.all
        @@all
    end

    def self.find(tempid, db)
        sql = <<-SQL 
            SELECT * FROM pokemon
            WHERE id = ?
        SQL
        result = db.execute(sql, tempid).first

        self.new(result[0], result[1], result[2], db)
    end
end
