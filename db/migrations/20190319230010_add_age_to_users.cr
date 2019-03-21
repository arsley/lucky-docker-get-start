class AddAgeToUsers::V20190319230010 < Avram::Migrator::Migration::V1
  def migrate
    alter :users do
      add age : Int32, default: 0
    end
  end

  def rollback
    # drop :things
  end
end
