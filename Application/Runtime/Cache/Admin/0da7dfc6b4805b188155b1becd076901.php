<?php if (!defined('THINK_PATH')) exit();?><form id="editButtonForm" method="post" action="<?php echo __ACTION__; ?>" data-validate="true" data-submit="ajax" class="form-horizontal">
	<div class="modal modal-small hide fade" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	    <h3><?php echo ($data['id'] ? '修改' : '添加'); ?>动作</h3>
	  </div>
	  <div class="modal-body">
	  	<input type="hidden" name="pid" value="<?php echo ($data["pid"]); ?>">
	  	<input type="hidden" name="id" value="<?php echo ($data["id"]); ?>">
		<div class="control-group">
			<label class="control-label must">名称</label>
			<div class="controls">
				<input type="text" autofocus="autofocus" name="title" value="<?php echo ($data["title"]); ?>" placeholder="最多15个字符" maxlength="15" class="required">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label must">唯一标识</label>
			<div class="controls">
				<input type="text" name="name" value="<?php echo ($data["name"]); ?>" placeholder="如：add、edit、delete等" maxlength="100" class="required">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">事件类型</label>
			<div class="controls">
				<select name="event_type" id="event_type">
					<option value="default" <?php echo ($data['event_type'] == 'default' ? 'selected' : ''); ?>>默认</option>
					<option value="custom" <?php echo ($data['event_type'] == 'custom' ? 'selected' : ''); ?>>自定义</option>
					<option value="view" <?php echo ($data['event_type'] == 'view' ? 'selected' : ''); ?>>视图</option>
				</select>
				<input type="text" name="event_value" style="display: none; width:125px;" maxlength="50" placeholder="系统默认" />
			</div>
		</div>
		<div class="control-group" id="view_target" style="display:none;">
			<label class="control-label">视图方式</label>
			<div class="controls">
				<select name="target" id="view_target_value">
					<option value="modal" <?php echo ($data['target'] == 'modal' ? 'selected' : ''); ?>>模态框</option>
					<option value="self" <?php echo ($data['target'] == 'self' ? 'selected' : ''); ?>>在本页打开</option>
					<option value="_blank" <?php echo ($data['target'] == '_blank' ? 'selected' : ''); ?>>在新窗口打开</option>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">状态</label>
			<div class="controls">
				<select name="groups" style="width:130px;">
					<option value="1" <?php echo ($data['groups'] == 1 ? 'selected' : ''); ?>>在第一组中</option>
					<option value="2" <?php echo ($data['groups'] == 2 ? 'selected' : ''); ?>>在第二组中</option>
					<option value="3" <?php echo ($data['groups'] == 3 ? 'selected' : ''); ?>>在第三组中</option>
				</select>
				<select name="visible" style="width:75px; margin-left:10px;">
					<option value="1" <?php echo ($data['visible'] == 1 ? 'selected' : ''); ?>>显示</option>
					<option value="0" <?php echo ($data['visible'] == 0 ? 'selected' : ''); ?>>隐藏</option>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">权限</label>
			<div class="controls">
				<select name="access">
					<option value="0" selected>系统默认</option>
					<option value="-1" <?php echo ($data['access'] == -1 ? 'selected' : ''); ?>>禁止访问</option>
					<option value="1" <?php echo ($data['access'] == 1 ? 'selected' : ''); ?>>无限制</option>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">图标</label>
			<div class="controls">
				<div class="input-append">
				  <input id="icon" type="text" name="icon" value="<?php echo ($data["icon"]); ?>" style="width: 175px;">
				  <span class="add-on" id="select_icon"><i class="icon-question-sign"></i></span>
				</div>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">排序</label>
			<div class="controls">
				<input type="text" name="sort" value="<?php echo ((isset($data["sort"]) && ($data["sort"] !== ""))?($data["sort"]):'0'); ?>" class="digits" placeholder="数字越大越靠前" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注</label>
			<div class="controls">
				<input type="text" name="remark" value="<?php echo ($data["remark"]); ?>" placeholder="备注说明" maxlength="50" />
			</div>
		</div>
	  </div>
	  <div class="modal-footer">
	  	<button type="button" class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
	  	<button type="submit" class="btn btn-primary" aria-hidden="true">保存</button>
	  </div>
    </div>
</form>
<script type="text/javascript">
$('#event_type').on('change', function(){
	var $this = $(this);
	var $event_value = $this.next();
	var $view_target = $('#view_target');
	if(this.value == 'default'){
		$this.css('width', '');
		$event_value.val('').css('display', 'none');
	}else{
		$this.css('width', '75px');
		$event_value.css('display', 'initial');
	}
	
	if(this.value == 'view'){
		$view_target.show();
	}else{
		$view_target.hide();
	}
}).trigger('change');

$('#view_target_value').on('change', function(){
	var $this = $(this);
	var $next = $(this).next();
	if(this.value == 'container'){
		$this.css('width', '75px');
		$next.css('display', 'initial').removeClass('ignore');
	}else{
		$this.css('width', '');
		$next.css('display', 'none').addClass('ignore');
	}
});

$('#icon_list').on('hide', function(){
	$('#editButtonForm').show();
});

$('#select_icon').on('click', function(){
	$('#editButtonForm').hide();
	$('#icon_list').modal({backdrop: false}).show();
});

$('#icon_list li').on('click', function(){
	var class_name = this.firstElementChild.getAttribute('class');
	$('#icon').val(class_name);
	$('#icon_list').modal('hide');
});
</script>

<style type="text/css">#icon_list ul li {float:left; width: 33.3%;}</style>

<div id="icon_list" class="form-horizontal modal hide fade" tabindex="-1" role="dialog">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3>从图标库中选择</h3>
  </div>
  <div class="modal-body">
  	<ul>
            <li><i class="icon-glass"></i> icon-glass</li>
            <li><i class="icon-music"></i> icon-music</li>
            <li><i class="icon-search"></i> icon-search</li>
            <li><i class="icon-envelope"></i> icon-envelope</li>
            <li><i class="icon-heart"></i> icon-heart</li>
            <li><i class="icon-star"></i> icon-star</li>
            <li><i class="icon-star-empty"></i> icon-star-empty</li>
            <li><i class="icon-user"></i> icon-user</li>
            <li><i class="icon-film"></i> icon-film</li>
            <li><i class="icon-th-large"></i> icon-th-large</li>
            <li><i class="icon-th"></i> icon-th</li>
            <li><i class="icon-th-list"></i> icon-th-list</li>
            <li><i class="icon-ok"></i> icon-ok</li>
            <li><i class="icon-remove"></i> icon-remove</li>
            <li><i class="icon-zoom-in"></i> icon-zoom-in</li>
            <li><i class="icon-zoom-out"></i> icon-zoom-out</li>
            <li><i class="icon-off"></i> icon-off</li>
            <li><i class="icon-signal"></i> icon-signal</li>
            <li><i class="icon-cog"></i> icon-cog</li>
            <li><i class="icon-trash"></i> icon-trash</li>
            <li><i class="icon-home"></i> icon-home</li>
            <li><i class="icon-file"></i> icon-file</li>
            <li><i class="icon-time"></i> icon-time</li>
            <li><i class="icon-road"></i> icon-road</li>
            <li><i class="icon-download-alt"></i> icon-download-alt</li>
            <li><i class="icon-download"></i> icon-download</li>
            <li><i class="icon-upload"></i> icon-upload</li>
            <li><i class="icon-inbox"></i> icon-inbox</li>

            <li><i class="icon-play-circle"></i> icon-play-circle</li>
            <li><i class="icon-repeat"></i> icon-repeat</li>
            <li><i class="icon-refresh"></i> icon-refresh</li>
            <li><i class="icon-list-alt"></i> icon-list-alt</li>
            <li><i class="icon-lock"></i> icon-lock</li>
            <li><i class="icon-flag"></i> icon-flag</li>
            <li><i class="icon-headphones"></i> icon-headphones</li>
            <li><i class="icon-volume-off"></i> icon-volume-off</li>
            <li><i class="icon-volume-down"></i> icon-volume-down</li>
            <li><i class="icon-volume-up"></i> icon-volume-up</li>
            <li><i class="icon-qrcode"></i> icon-qrcode</li>
            <li><i class="icon-barcode"></i> icon-barcode</li>
            <li><i class="icon-tag"></i> icon-tag</li>
            <li><i class="icon-tags"></i> icon-tags</li>
            <li><i class="icon-book"></i> icon-book</li>
            <li><i class="icon-bookmark"></i> icon-bookmark</li>
            <li><i class="icon-print"></i> icon-print</li>
            <li><i class="icon-camera"></i> icon-camera</li>
            <li><i class="icon-font"></i> icon-font</li>
            <li><i class="icon-bold"></i> icon-bold</li>
            <li><i class="icon-italic"></i> icon-italic</li>
            <li><i class="icon-text-height"></i> icon-text-height</li>
            <li><i class="icon-text-width"></i> icon-text-width</li>
            <li><i class="icon-align-left"></i> icon-align-left</li>
            <li><i class="icon-align-center"></i> icon-align-center</li>
            <li><i class="icon-align-right"></i> icon-align-right</li>
            <li><i class="icon-align-justify"></i> icon-align-justify</li>
            <li><i class="icon-list"></i> icon-list</li>

            <li><i class="icon-indent-left"></i> icon-indent-left</li>
            <li><i class="icon-indent-right"></i> icon-indent-right</li>
            <li><i class="icon-facetime-video"></i> icon-facetime-video</li>
            <li><i class="icon-picture"></i> icon-picture</li>
            <li><i class="icon-pencil"></i> icon-pencil</li>
            <li><i class="icon-map-marker"></i> icon-map-marker</li>
            <li><i class="icon-adjust"></i> icon-adjust</li>
            <li><i class="icon-tint"></i> icon-tint</li>
            <li><i class="icon-edit"></i> icon-edit</li>
            <li><i class="icon-share"></i> icon-share</li>
            <li><i class="icon-check"></i> icon-check</li>
            <li><i class="icon-move"></i> icon-move</li>
            <li><i class="icon-step-backward"></i> icon-step-backward</li>
            <li><i class="icon-fast-backward"></i> icon-fast-backward</li>
            <li><i class="icon-backward"></i> icon-backward</li>
            <li><i class="icon-play"></i> icon-play</li>
            <li><i class="icon-pause"></i> icon-pause</li>
            <li><i class="icon-stop"></i> icon-stop</li>
            <li><i class="icon-forward"></i> icon-forward</li>
            <li><i class="icon-fast-forward"></i> icon-fast-forward</li>
            <li><i class="icon-step-forward"></i> icon-step-forward</li>
            <li><i class="icon-eject"></i> icon-eject</li>
            <li><i class="icon-chevron-left"></i> icon-chevron-left</li>
            <li><i class="icon-chevron-right"></i> icon-chevron-right</li>
            <li><i class="icon-plus-sign"></i> icon-plus-sign</li>
            <li><i class="icon-minus-sign"></i> icon-minus-sign</li>
            <li><i class="icon-remove-sign"></i> icon-remove-sign</li>
            <li><i class="icon-ok-sign"></i> icon-ok-sign</li>

            <li><i class="icon-question-sign"></i> icon-question-sign</li>
            <li><i class="icon-info-sign"></i> icon-info-sign</li>
            <li><i class="icon-screenshot"></i> icon-screenshot</li>
            <li><i class="icon-remove-circle"></i> icon-remove-circle</li>
            <li><i class="icon-ok-circle"></i> icon-ok-circle</li>
            <li><i class="icon-ban-circle"></i> icon-ban-circle</li>
            <li><i class="icon-arrow-left"></i> icon-arrow-left</li>
            <li><i class="icon-arrow-right"></i> icon-arrow-right</li>
            <li><i class="icon-arrow-up"></i> icon-arrow-up</li>
            <li><i class="icon-arrow-down"></i> icon-arrow-down</li>
            <li><i class="icon-share-alt"></i> icon-share-alt</li>
            <li><i class="icon-resize-full"></i> icon-resize-full</li>
            <li><i class="icon-resize-small"></i> icon-resize-small</li>
            <li><i class="icon-plus"></i> icon-plus</li>
            <li><i class="icon-minus"></i> icon-minus</li>
            <li><i class="icon-asterisk"></i> icon-asterisk</li>
            <li><i class="icon-exclamation-sign"></i> icon-exclamation-sign</li>
            <li><i class="icon-gift"></i> icon-gift</li>
            <li><i class="icon-leaf"></i> icon-leaf</li>
            <li><i class="icon-fire"></i> icon-fire</li>
            <li><i class="icon-eye-open"></i> icon-eye-open</li>
            <li><i class="icon-eye-close"></i> icon-eye-close</li>
            <li><i class="icon-warning-sign"></i> icon-warning-sign</li>
            <li><i class="icon-plane"></i> icon-plane</li>
            <li><i class="icon-calendar"></i> icon-calendar</li>
            <li><i class="icon-random"></i> icon-random</li>
            <li><i class="icon-comment"></i> icon-comment</li>
            <li><i class="icon-magnet"></i> icon-magnet</li>

            <li><i class="icon-chevron-up"></i> icon-chevron-up</li>
            <li><i class="icon-chevron-down"></i> icon-chevron-down</li>
            <li><i class="icon-retweet"></i> icon-retweet</li>
            <li><i class="icon-shopping-cart"></i> icon-shopping-cart</li>
            <li><i class="icon-folder-close"></i> icon-folder-close</li>
            <li><i class="icon-folder-open"></i> icon-folder-open</li>
            <li><i class="icon-resize-vertical"></i> icon-resize-vertical</li>
            <li><i class="icon-resize-horizontal"></i> icon-resize-horizontal</li>
            <li><i class="icon-hdd"></i> icon-hdd</li>
            <li><i class="icon-bullhorn"></i> icon-bullhorn</li>
            <li><i class="icon-bell"></i> icon-bell</li>
            <li><i class="icon-certificate"></i> icon-certificate</li>
            <li><i class="icon-thumbs-up"></i> icon-thumbs-up</li>
            <li><i class="icon-thumbs-down"></i> icon-thumbs-down</li>
            <li><i class="icon-hand-right"></i> icon-hand-right</li>
            <li><i class="icon-hand-left"></i> icon-hand-left</li>
            <li><i class="icon-hand-up"></i> icon-hand-up</li>
            <li><i class="icon-hand-down"></i> icon-hand-down</li>
            <li><i class="icon-circle-arrow-right"></i> icon-circle-arrow-right</li>
            <li><i class="icon-circle-arrow-left"></i> icon-circle-arrow-left</li>
            <li><i class="icon-circle-arrow-up"></i> icon-circle-arrow-up</li>
            <li><i class="icon-circle-arrow-down"></i> icon-circle-arrow-down</li>
            <li><i class="icon-globe"></i> icon-globe</li>
            <li><i class="icon-wrench"></i> icon-wrench</li>
            <li><i class="icon-tasks"></i> icon-tasks</li>
            <li><i class="icon-filter"></i> icon-filter</li>
            <li><i class="icon-briefcase"></i> icon-briefcase</li>
            <li><i class="icon-fullscreen"></i> icon-fullscreen</li>
	</ul>
  </div>
  <div class="modal-footer">
  	<button type="button" class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
</div>