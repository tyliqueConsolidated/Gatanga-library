<div class="content-wrapper">
    <section class="content-header">
  		<h1><?=$this->lang->line('requestbook')?></h1>
  		<ol class="breadcrumb">
        	<li><a href="<?=base_url('dashboard/index')?>"><i class="fa fa-dashboard"></i><?=$this->lang->line('dashboard')?></a></li>
  			<li><a href="<?=base_url('requestbook/index')?>"><?=$this->lang->line('requestbook')?></a></li>
  			<li class="active"><?=$this->lang->line('add')?></li>
  		</ol>
    </section>
    <section class="content">
		<div class="box box-mytheme">
			<div class="row">
				<div class="col-md-6">
					<form role="form" method="post" enctype="multipart/form-data">
						<div class="box-body">
							<div class="form-group <?=form_error('name') ? 'has-error' : ''?>">
							 	<label for="name"><?=$this->lang->line('requestbook_name')?></label> <span class="text-red">*</span>
							  	<input type="text" class="form-control" id="name" name="name" value="<?=set_value('name', $requestbook->name)?>" placeholder="Enter name">
							  	<?=form_error('name')?>
							</div>

							<div class="form-group <?=form_error('author') ? 'has-error' : ''?>">
							 	<label for="author"><?=$this->lang->line('requestbook_author')?></label> <span class="text-red">*</span>
							  	<input type="text" class="form-control" id="author" name="author" value="<?=set_value('author', $requestbook->author)?>" placeholder="Enter Author">
							  	<?=form_error('author')?>
							</div>

							<div class="form-group <?=form_error('quantity') ? 'has-error' : ''?>">
							 	<label for="quantity"><?=$this->lang->line('requestbook_quantity')?></label> <span class="text-red">*</span>
							  	<input type="number" class="form-control" id="quantity" name="quantity" value="<?=set_value('quantity')?>" placeholder="Enter Quantity">
							  	<?=form_error('quantity')?>
							</div>

							<div class="form-group <?=form_error('price') ? 'has-error' : ''?>">
							 	<label for="price"><?=$this->lang->line('requestbook_price')?></label> <span class="text-red">*</span>
							  	<input type="text" class="form-control" id="price" name="price" value="<?=set_value('price')?>" placeholder="Enter Price">
							  	<?=form_error('price')?>
							</div>

							<div class="form-group <?=form_error('codeno') ? 'has-error' : ''?>">
							 	<label for="codeno"><?=$this->lang->line('requestbook_code_no')?></label> <span class="text-red">*</span>
							  	<input type="text" class="form-control" id="codeno" name="codeno" value="<?=set_value('codeno')?>" placeholder="Enter Code No">
							  	<?=form_error('codeno')?>
							</div>								

							<div class="form-group <?=form_error('coverphoto') ? 'has-error' : ''?>">
						        <label for="coverphoto"><?=$this->lang->line("requestbook_cover_photo")?></label> <span class="text-red">*</span>
						        <div class="input-group image-preview">
						            <input type="text" class="form-control image-preview-filename" disabled="disabled">
						            <span class="input-group-btn">
						                <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
						                    <span class="fa fa-remove"></span><?=$this->lang->line('requestbook_clear')?>
						                </button>
						                <div class="btn btn-success image-preview-input">
						                    <span class="fa fa-repeat"></span>
						                    <span class="image-preview-input-title"><?=$this->lang->line('requestbook_filebrowse')?></span>
						                    <input type="file" accept="image/png, image/jpeg, image/gif" name="coverphoto"/>
						                </div>
						            </span>
						        </div>
						        <div class="input-group">
						        	<img class="userprofileimg" src="<?=app_image_link($requestbook->coverphoto,'uploads/book/','requestbook.jpg')?>" alt="">
						        </div>
						      	<?=form_error('coverphoto');?>
						    </div>

							<div class="form-group <?=form_error('bookcategoryID') ? 'has-error' : ''?>">
							  	<label for="bookcategoryID"><?=$this->lang->line('requestbook_book_category')?></label>
								<?php 
									$bookcategoryArray = [];
									$bookcategoryArray[0] = $this->lang->line('requestbook_please_select');
									if(calculate($bookcategorys)) {
										foreach($bookcategorys as $bookcategory) {
											$bookcategoryArray[$bookcategory->bookcategoryID] = $bookcategory->name;
										}
									}
									echo form_dropdown('bookcategoryID', $bookcategoryArray, set_value('bookcategoryID', $requestbook->bookcategoryID), 'id="bookcategoryID" class="form-control"');
								?>
							  	<?=form_error('bookcategoryID')?>
							</div>

							<div class="form-group <?=form_error('isbnno') ? 'has-error' : ''?>">
							 	<label for="isbnno"><?=$this->lang->line('requestbook_isbn_no')?></label>
							  	<input type="text" class="form-control" id="isbnno" name="isbnno" value="<?=set_value('isbnno', $requestbook->isbnno)?>" placeholder="Enter isbnno">
							  	<?=form_error('isbnno')?>
							</div>
							
							<div class="form-group <?=form_error('rackID') ? 'has-error' : ''?>">
							  	<label for="rackID"><?=$this->lang->line('requestbook_rack')?></label>
								<?php 
									$rackArray = [];
									$rackArray[0] = $this->lang->line('requestbook_please_select');
									if(calculate($racks)) {
										foreach($racks as $rack) {
											$rackArray[$rack->rackID] = $rack->name;
										}
									}

									echo form_dropdown('rackID', $rackArray, set_value('rackID'), 'id="rackID" class="form-control"');
								?>
							  	<?=form_error('rackID')?>
							</div>

						    <div class="form-group <?=form_error('editionnumber') ? 'has-error' : ''?>">
							 	<label for="editionnumber"><?=$this->lang->line('requestbook_edition_number')?></label>
							  	<input type="text" class="form-control" id="editionnumber" name="editionnumber" value="<?=set_value('editionnumber', $requestbook->editionnumber)?>" placeholder="Enter Edition Number">
							  	<?=form_error('editionnumber')?>
							</div>
							
							<div class="form-group <?=form_error('editiondate') ? 'has-error' : ''?>">
							 	<label for="editiondate"><?=$this->lang->line('requestbook_edition_date')?></label>
							 	<?php $editiondate = isset($requestbook->editiondate) ? date('d-m-Y',strtotime($requestbook->editiondate)) : ''?>
							  	<input type="text" class="form-control datepicker" id="editiondate" name="editiondate" value="<?=set_value('editiondate', $editiondate)?>" placeholder="Enter Edition Date">
							  	<?=form_error('editiondate')?>
							</div>
							
							<div class="form-group <?=form_error('publisher') ? 'has-error' : ''?>">
							 	<label for="publisher"><?=$this->lang->line('requestbook_publisher')?></label>
							  	<input type="text" class="form-control" id="publisher" name="publisher" value="<?=set_value('publisher', $requestbook->publisher)?>" placeholder="Enter Publisher">
							  	<?=form_error('publisher')?>
							</div>
							
							<div class="form-group <?=form_error('publisheddate') ? 'has-error' : ''?>">
							 	<label for="publisheddate"><?=$this->lang->line('requestbook_published_date')?></label>
							 	<?php $publisheddate = isset($requestbook->publisheddate) ? date('d-m-Y',strtotime($requestbook->publisheddate)) : ''?>
							  	<input type="text" class="form-control datepicker" id="publisheddate" name="publisheddate" value="<?=set_value('publisheddate', $publisheddate)?>" placeholder="Enter Published Date">
							  	<?=form_error('publisheddate')?>
							</div>
							
							<div class="form-group <?=form_error('notes') ? 'has-error' : ''?>">
							  	<label for="notes"><?=$this->lang->line('requestbook_notes')?></label>
							  	<textarea name="notes"  id="notes" cols="30" rows="5" class="form-control" placeholder="Enter Notes"><?=set_value('notes', $requestbook->notes)?></textarea>
							  	<?=form_error('notes')?>
							</div>
						</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-mytheme"><?=$this->lang->line('requestbook_add_book')?></button>
						</div>
					</form>
				</div>
			</div>
		</div>
    </section>
</div>