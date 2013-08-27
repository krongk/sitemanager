#encoding: utf-8
module ApplicationHelper

  SMS_SEND_STATUS = {
    0 => '成功', 
    30 => '密码错误',
    40 => '账户错误',
    41 => '欠费',
    42 => '账户过期',
    43 => 'IP被封',
    50 => '敏感内容',
    51 => '号码错误',
    100 => '未知错误'
  }
  BADGE_FLAG = {'success' => '成功', 'warning' => '警告', 'important' => '严重', 'info' => '提示', 'inverse' => '失败'}

  def title(page_title)
    content_for(:title){ page_title}
  end
  def meta_keywords(meta_keywords)
    content_for(:meta_keywords){ meta_keywords}
  end
  def meta_description(meta_description)
    content_for(:meta_description){ meta_description}
  end
  
  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def rand_flag
    BADGE_FLAG.keys[rand(5)]
  end

  #[3,0][1,30] => [sms_tmp_id, send_status]
  def show_send_status(is_processed)
    if is_processed == 'n'
      return "<span class='badge badge-info' title='未发送'>未发送</span>".html_safe
    end

    arr = []
    is_processed.split("|").each do |s|
      sms_tmp_id, send_status = s.split(',')
      flag = case send_status.to_i
      when 0 then 'success'
      when 30..42 then 'warning'
      when 43..51 then 'important'
      else 'inverse'
      end
      arr << "<span class='badge badge-#{flag}' title='#{BADGE_FLAG[flag]}'>#{sms_tmp_id}</span>"
    end
    arr.join.html_safe
  end

  def check_nil(resource)
    if resource.nil?
      redirect_to "/", notice: "没有找到"
      return
    end
  end

  def generate_site_post_url(site, title)
    return site_path(site) unless ['about', 'service', 'post_list'].include?(title)
    "/sites/#{site.id}/site_posts/#{title}"
  end

  def page_header(title, sub_title)
    %{
      <div class="row-fluid">
        <div class="span12">
          <div class="page-header">

            <!-- page title -->
            <h1 class="pull-left">
              <i class="icon-star"></i>
              <span>#{title}</span>
            </h1>

            <!-- breadcrumbs -->
            <div class="pull-right">
              <ul class="breadcrumb">
                <li>
                  <a href="/home/index"><i class="icon-bar-chart"></i>
                  </a>
                </li>
                <li class="separator">
                  <i class="icon-angle-right"></i>
                </li>
                <li class="active">#{sub_title}</li>
              </ul>
            </div>

          </div>
        </div>
      </div>
    }.html_safe
  end

  #flash动画显示
  # eg: play_flash("flash/top_banner.swf")
  # or: play_flash asset_path("flash/top_banner.swf"), :width => '985', :height => '249'
  def play_flash(src, options = {:width=>'600', :height=>'400'})
    str = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' width='"+ options[:width] +"' height='"+ options[:height] +"' id='FlashID' accesskey='1' tabindex='1' title='daiii'>
        <param name='movie' value='" + src + "' />
        <param name='quality' value='high' />
        <param name='wmode' value='transparent' />
        <param name='swfversion' value='9.0.45.0' />
        <!--[if !IE]>-->
        <object type='application/x-shockwave-flash' data='" + src + "' width='"+  options[:width] +"' height='"+  options[:height] +"'>
          <!--<![endif]-->
          <param name='movie' value='" + src + "' />
          <param name='quality' value='high' />
          <param name='wmode' value='transparent' />
          <param name='swfversion' value='9.0.45.0' />
          <div>
            <h4>Plsease update Adobe Flash Player。</h4>
          </div>
          <!--[if !IE]>-->
        </object>
        <!--<![endif]-->
      </object>"
    return str.html_safe
  end
end
