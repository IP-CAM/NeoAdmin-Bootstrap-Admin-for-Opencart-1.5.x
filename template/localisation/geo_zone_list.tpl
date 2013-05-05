<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/country.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button insert"><i class="icon-plus"></i> <?php echo $button_insert; ?></a><a onclick="$('form').submit();" class="button delete"><i class="icon-trash"></i> <?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="responsive list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php if ($sort == 'name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'description') { ?>
                <a href="<?php echo $sort_description; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_description; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_description; ?>"><?php echo $column_description; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($geo_zones) { ?>
            <?php foreach ($geo_zones as $geo_zone) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($geo_zone['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $geo_zone['geo_zone_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $geo_zone['geo_zone_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $geo_zone['name']; ?></td>
              <td class="left"><?php echo $geo_zone['description']; ?></td>
              <td class="right"><?php foreach ($geo_zone['action'] as $action) { ?>
                <a class="button edit" href="<?php echo $action['href']; ?>"><i class="icon-edit"></i> <?php echo $action['text']; ?></a>
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<?php echo $footer; ?>