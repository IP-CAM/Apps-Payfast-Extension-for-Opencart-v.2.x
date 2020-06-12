<?php

class ControllerExtensionPaymentPayfast extends Controller {

    private $error = array();

    public function index() {
        $this->load->language('extension/payment/payfast');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('payfast', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true));
        }

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['merchant_id'])) {
            $data['error_merchant_id'] = $this->error['merchant_id'];
        } else {
            $data['error_merchant_id'] = '';
        }

        if (isset($this->error['security_key'])) {
            $data['error_security_key'] = $this->error['security_key'];
        } else {
            $data['error_security_key'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_extension'),
            'href' => $this->url->link('marketplace/extension', 'token=' . $this->session->data['token'] . '&type=payment', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/payment/payfast', 'token=' . $this->session->data['token'], true)
        );

        //$data['action'] = $this->url->link('extension/payment/payfast', 'token=' . $this->session->data['token'], true);

        $data['action'] = $this->url->link('extension/payment/payfast', 'token=' . $this->session->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true);

        if (isset($this->request->post['payfast_merchant_id'])) {
            $data['payment_payfast_merchant_id'] = $this->request->post['payfast_merchant_id'];
        } else {
            $data['payment_payfast_merchant_id'] = $this->config->get('payfast_merchant_id');
        }

        if (isset($this->request->post['payfast_security_key'])) {
            $data['payment_payfast_security_key'] = $this->request->post['payfast_security_key'];
        } else {
            $data['payment_payfast_security_key'] = $this->config->get('payfast_security_key');
        }

        if (isset($this->request->post['payfast_merchant_name'])) {
            $data['payment_payfast_merchant_name'] = $this->request->post['payfast_merchant_name'];
        } else {
            $data['payment_payfast_merchant_name'] = $this->config->get('payfast_merchant_name');
        }


        if (isset($this->request->post['payfast_order_status_id'])) {
            $data['payment_payfast_order_status_id'] = $this->request->post['payfast_order_status_id'];
        } else {
            $data['payment_payfast_order_status_id'] = $this->config->get('payfast_order_status_id');
        }

        if (isset($this->request->post['payfast_pending_status_id'])) {
            $data['payment_payfast_pending_status_id'] = $this->request->post['payfast_pending_status_id'];
        } else {
            $data['payment_payfast_pending_status_id'] = $this->config->get('payfast_pending_status_id');
        }

        if (isset($this->request->post['payfast_canceled_status_id'])) {
            $data['payment_payfast_canceled_status_id'] = $this->request->post['payfast_canceled_status_id'];
        } else {
            $data['payment_payfast_canceled_status_id'] = $this->config->get('payfast_canceled_status_id');
        }

        if (isset($this->request->post['payfast_failed_status_id'])) {
            $data['payment_payfast_failed_status_id'] = $this->request->post['payfast_failed_status_id'];
        } else {
            $data['payment_payfast_failed_status_id'] = $this->config->get('payfast_failed_status_id');
        }

        if (isset($this->request->post['payfast_chargeback_status_id'])) {
            $data['payment_payfast_chargeback_status_id'] = $this->request->post['payfast_chargeback_status_id'];
        } else {
            $data['payment_payfast_chargeback_status_id'] = $this->config->get('payfast_chargeback_status_id');
        }

        $this->load->model('localisation/order_status');

        $data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

        if (isset($this->request->post['payfast_geo_zone_id'])) {
            $data['payment_payfast_geo_zone_id'] = $this->request->post['payfast_geo_zone_id'];
        } else {
            $data['payment_payfast_geo_zone_id'] = $this->config->get('payfast_geo_zone_id');
        }

        $this->load->model('localisation/geo_zone');

        $data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

        if (isset($this->request->post['payfast_status'])) {
            $data['payment_payfast_status'] = $this->request->post['payfast_status'];
        } else {
            $data['payment_payfast_status'] = $this->config->get('payfast_status');
        }

        if (isset($this->request->post['payfast_sort_order'])) {
            $data['payment_payfast_sort_order'] = $this->request->post['payfast_sort_order'];
        } else {
            $data['payment_payfast_sort_order'] = $this->config->get('payfast_sort_order');
        }

        if (isset($this->request->post['payfast_rid'])) {
            $data['payment_payfast_rid'] = $this->request->post['payfast_rid'];
        } else {
            $data['payment_payfast_rid'] = $this->config->get('payfast_rid');
        }

        if (isset($this->request->post['payfast_custnote'])) {
            $data['payment_payfast_custnote'] = $this->request->post['payfast_custnote'];
        } else {
            $data['payment_payfast_custnote'] = $this->config->get('payfast_custnote');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $data['heading_title'] = $this->language->get('heading_title');
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_all_zones'] = $this->language->get('text_all_zones');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_successful'] = $this->language->get('text_successful');
        $data['text_declined'] = $this->language->get('text_declined');
        $data['text_off'] = $this->language->get('text_off');

        $data['entry_merchant_id'] = $this->language->get('entry_merchant_id');
        $data['entry_security_key'] = $this->language->get('entry_security_key');
        $data['entry_merchant_name'] = $this->language->get('entry_merchant_name');
        $data['entry_test'] = $this->language->get('entry_test');
        $data['entry_total'] = $this->language->get('entry_total');
        $data['entry_order_status'] = $this->language->get('entry_order_status');
        $data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        $data['entry_pending_status'] = $this->language->get('entry_pending_status');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['entry_canceled_status'] = $this->language->get('entry_canceled_status');
        $data['entry_chargeback_status'] = $this->language->get('entry_chargeback_status');
        $data['entry_failed_status'] = $this->language->get('entry_failed_status');
        $data['text_edit'] = $this->language->get('text_edit');

        $this->response->setOutput($this->load->view('extension/payment/payfast', $data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'extension/payment/payfast')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }


        if (isset($this->request->post['payfast_merchant_id'])) {
            if (!$this->request->post['payfast_merchant_id']) {
                $this->error['merchant_id'] = $this->language->get('error_merchant_id');
            }
        }

        if (isset($this->request->post['payfast_security_key'])) {
            if (!$this->request->post['payfast_security_key']) {
                $this->error['security_key'] = $this->language->get('error_security_key');
            }
        }

        return !$this->error;
    }

}
