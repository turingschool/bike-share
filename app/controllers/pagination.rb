module Pagination

  MODELS_PER_PAGE = 30

  def page_display(model_list, page_num)
    model_list.limit(MODELS_PER_PAGE).offset((page_num - 1) * MODELS_PER_PAGE)
  end

  def find_total_pages(model_count)
    (model_count / MODELS_PER_PAGE.to_f).ceil
  end

  def next_page(page_num, item_count)
    page_num < find_total_pages(item_count) ? page_num + 1 : page_num = 1
  end

  def previous_page(page_num)
    page_num - 1 unless page_num <= 1
  end
end
