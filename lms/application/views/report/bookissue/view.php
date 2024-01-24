<style type="text/css">
	.reportheader {
		text-align: center;
		margin-bottom: 10px;
	}
	.reportheader p{
		margin-bottom: 0px;
	}
	.reporttable {
		overflow: hidden;
	}
	.reportnotfound {
		text-align: center;
		font-size: 20px;
		border: 1px solid #ddd;
		padding: 15px 10px;
	}

	.reportfooter {
		text-align: center;
	}

	.reportfooter h4 {
		margin-bottom: 2px;
	}

	.table-bordered {
		border: 1px solid #ddd;
	}

	@media print {
		body {
			-webkit-print-color-adjust: exact !important;
		}

		tr.info th {
			background: #d9edf7 !important;
		}
	}

</style>
<div class="reportheader">
	<h2><?=$generalsetting->sitename?></h2>
	<p><?=$generalsetting->phone?></p>
	<p><?=$generalsetting->email?></p>
	<p><?=$generalsetting->address?></p>
</div>
<?php if(calculate($bookissues)) { ?>
	<table class="table table-hover table-striped table-bordered reporttable">
		<thead>
			<tr class="info">
				<th>#</th>
				<th><?=$this->lang->line('bookissuereport_photo')?></th>
				<th><?=$this->lang->line('bookissuereport_name')?></th>
				<th><?=$this->lang->line('bookissuereport_role')?></th>
				<th><?=$this->lang->line('bookissuereport_book_name')?></th>
				<th><?=$this->lang->line('bookissuereport_book_no')?></th>
				<th><?=$this->lang->line('bookissuereport_issue_date')?></th>
				<th><?=$this->lang->line('bookissuereport_expire_date')?></th>
				<th><?=$this->lang->line('bookissuereport_renewed')?></th>
				<th><?=$this->lang->line('bookissuereport_status')?></th>
			</tr>
		</thead>
		<tbody>
			<?php $i=0; foreach($bookissues as $bookissue) { $i++; ?>
			<tr>
				<td><?=$i?></td>
				<td><img src="<?=app_image_link(isset($members[$bookissue->memberID]) ? $members[$bookissue->memberID]->photo : '', 'uploads/images/')?>" class="profile_img"></td>
				<td><?=isset($members[$bookissue->memberID]) ? $members[$bookissue->memberID]->name : ''?></td>
				<td><?=isset($roles[$bookissue->roleID]) ? $roles[$bookissue->roleID]->role : ''?></td>
				<td><?=isset($books[$bookissue->bookID]) ? $books[$bookissue->bookID] : ''?></td>
				<td><?=$bookissue->bookno?></td>
				<td><?=app_date($bookissue->issue_date)?></td>
				<td><?=app_date($bookissue->expire_date)?></td>
				<td><?=$bookissue->renewed?></td>
				<td>
					<?php
						if($bookissue->status == 0) {
							echo 'Issued';
						} elseif($bookissue->status == 1) {
							echo 'Return';
						} elseif($bookissue->status == 2) {
							echo 'Lost';
						}
					?>						
				</td>
			</tr>
			<?php } ?>
		</tbody>
	</table>
	<?php } else { ?>
	<div class="reportnotfound">
		<?=$this->lang->line('bookissuereport_issue_book_not_available')?>
	</div>
<?php } ?>
<div class="reportfooter">
	<h4><?=$generalsetting->sitename?></h4>
	<p><?=$generalsetting->address?></p>
</div>
