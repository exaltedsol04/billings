<?php 
//error_reporting(0);
    include_once 'init.php';
    @session_start();
    $action = $_POST['action'];

    switch($action)
    {
		case "searchUsersList":
			$search = isset($_POST['search']) ? trim($_POST['search']) : '';

			$where = "WHERE status = 1 AND deleted_at IS NULL";
			$params = [];

			if (!empty($search)) {
				$where .= " AND (name LIKE :search OR email LIKE :search)";
				$params[':search'] = "%$search%";
			}

			$fields = "id, name, email";
			$users = $general_cls_call->select_query($fields, USERS, $where, $params, 2);

			$html = '';

			if ($users[0] != '') {
				foreach ($users as $user) {
					$html .= '
					<div class="d-flex align-items-center gap-3 user-row">
						<div class="flex-grow-1">
							<h6 class="mb-0">'.$user->name.'</h6>
							<p class="mb-0">'.$user->email.'</p>
						</div>
						<div class="form-check form-check-inline me-0">
							<input class="form-check-input ms-0 user-checkbox" type="checkbox" value="'.$user->id.'">
						</div>
					</div>';
				}
			} else {
				$html = '<p class="text-center">No users found</p>';
			}

			echo $html;
		break;
		case "sendNotification":
			$type = $_POST['type'];

			// Sanitize IDs
			$notificationIds = array_map('intval', $_POST['notification_ids']);
			if (empty($notificationIds)) {
				echo 'No notifications selected';
				exit;
			}
			// 1. Fetch notifications
			$placeholders = implode(',', array_fill(0, count($notificationIds), '?'));
			$fields = "id, title, message";
			$where  = "WHERE id IN ($placeholders) AND status != ?";
			$params = $notificationIds;
			$params[] = 2; 
			$notifications = $general_cls_call->select_query($fields, NOTIFICATIONS, $where, $params, 2);

			if ($type == 'all') {
				
				if (empty($notifications)) {
					echo 'No valid notifications found';
					exit;
				}
				
				$search = trim($_POST['search']);
				$where = "WHERE status = 1 AND deleted_at IS NULL";
				$params = [];

				if (!empty($search)) {
					$where .= " AND (name LIKE :search OR email LIKE :search)";
					$params[':search'] = "%$search%";
				}

				$users = $general_cls_call->select_query("id", USERS, $where, $params, 2);

				foreach ($users as $user) {
					foreach ($notifications as $notification) {
						$fcm->sendUserNotification(
							$user->id,
							$notification->title,
							$notification->message,
							[
								"screen" => "TEST notification"
							]
						);
					}
				}

				echo "success";
			}

			if ($type == 'selected') {

				$userIds = $_POST['user_ids'];

				foreach ($userIds as $id) {
					foreach ($notifications as $notification) {
						$fcm->sendUserNotification(
							$id,
							$notification->title,
							$notification->message,
							[
								"screen" => "TEST notification"
							]
						);
					}
				}

				echo "success";
			}
		break;
    }
?>