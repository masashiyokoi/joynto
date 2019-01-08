module ApplicationHelper
  def md_to_html(text)
      options = {
        filter_html:     true,
        hard_wrap:       true,
        space_after_headers: true,
      }

      extensions = {
        autolink:           true,
        no_intra_emphasis:  true,
        fenced_code_blocks: true,
      }

      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)

      markdown.render(text).html_safe
    end

  end
