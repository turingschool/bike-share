module RestUrl

  def home
    '/'
  end

  def sub_path(path_within_model = "")
    url("/#{@model.name.downcase}s#{path_within_model}")
  end
  alias index sub_path
  alias create sub_path

  def create_form
    sub_path("/new")
  end
  def update_form(id)
    sub_path("/#{id}/edit")
  end
  def show(id)
    sub_path("/#{id}")
  end
  alias update show
  alias destroy show

  def dashboard
    url "/#{@model.name.downcase}-dashboard"
  end

end
