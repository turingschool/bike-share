module Route

  def self.[](*part_names)
    content = part_names.map(&parts).join
    /#{content}/
  end

  def self.parts
    {
      model: '\/(station|trip|condition)s?',
      dashboard: '-dashboard',
      new: '\/new',
      edit: '\/edit',
      id: '\/([1-9]\d*)'
    }
  end
end

# Patten[:model]
# => ^\/station$
# => /station

# Patten[:model, :new]
# => ^\/station\/new$
# => /station/new

# Patten[:model, :id]
# => ^\/station\/\d+$
# => /station/23

# Patten[:model, :id, :edit]
# => ^\/station\/\d+\/edit$
# => /station/23

# Patten[:model, :dashboard]
# => ^\/station-dashboard$
# => /station-dashboard
