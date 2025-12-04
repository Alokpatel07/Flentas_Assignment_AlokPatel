# AWS Cost Monitoring — README

This README explains, in simple language, how to set up cost monitoring and Free Tier alerts in AWS. Follow these steps to avoid unexpected bills.

---

## 1. Why cost monitoring matters

AWS charges you for what you use. If you forget to stop or delete resources (like virtual machines), costs can grow quickly. Monitoring helps you know when spending starts and gives you time to fix it.

---

## 2. Common causes of sudden bill increases

* Leaving an **EC2 instance** running 24/7
* Creating a **NAT Gateway** (costly per hour and per GB)
* Having many **EBS volumes** or snapshots
* Large **data transfer** out of AWS
* Using paid tiers of services after Free Tier ends
* Forgetting to delete test resources (RDS, Load Balancer, etc.)

---

## 3. Create a CloudWatch Billing Alarm for ₹100 (step-by-step)

> Important note: AWS billing metrics are usually in **USD**. We set the alarm using an equivalent USD value for ₹100. Exchange rates change — at the time of writing, using **1.2 USD** is a simple approximation for ₹100. If you want exact conversion, check the current USD→INR rate and divide ₹100 by that rate.

### Step A — Turn on billing alerts

1. Sign in to the AWS Management Console.
2. Click your **account name** (top-right) → **Account**.
3. Under **Billing preferences**, tick **Receive Billing Alerts** and **Save**.

### Step B — Open CloudWatch

1. In the AWS Console search bar type **CloudWatch** and open it.
2. In the left menu choose **Alarms** → **All alarms**.
3. Click **Create alarm**.

### Step C — Choose the billing metric

1. Click **Select metric**.
2. Navigate to **Billing** → **Per-Region Metrics** (or **Total Estimated Charge**).
3. Select **EstimatedCharges** (make sure the unit is USD).

### Step D — Set the threshold (≈ ₹100)

1. For the condition, choose **Greater/Equal**.
2. Enter **1.2** as the value (this is roughly ₹100). If you prefer, change it to the precise USD value you calculate.
3. Click **Next**.

### Step E — Add notification (email)

1. Under **Notification**, choose **Create new topic**.
2. Enter a name like `billing-alerts-topic` and add your email address.
3. You will get a confirmation email — open it and **confirm subscription**.
4. After confirming, proceed and click **Next**.

### Step F — Name and create

1. Give the alarm a clear name, e.g. `AlokPatelBillingAlarm`.
2. Review and click **Create alarm**.

Now CloudWatch will send an email when estimated charges reach that USD value.

---

## 4. Enable Free Tier Usage Alerts (step-by-step)

Free Tier alerts warn you when you are about to exceed Free Tier limits.

1. Sign in to the AWS Console.
2. Go to **Billing Dashboard** (from your account menu or search for Billing).
3. From the left menu choose **Free Tier**.
4. Click **Free Tier preferences** (or a button labeled **Preferences** on that page).
5. Turn on **Free Tier usage alerts** and enter the email address where you want alerts.
6. Save the settings.

AWS will email you when your Free Tier usage is approaching or has exceeded limits for services like EC2, S3, or RDS.

----


1. **Billing Alarm screenshot**

   * Console path: **CloudWatch → Alarms → (your alarm)**
   * Screenshot shows: the alarm **name**, **threshold (1.2 USD)**, and the **state** (OK / ALARM / INSUFFICIENT DATA).


2. **Free Tier Usage Alerts page**

   * Console path: **Billing Dashboard → Free Tier → Preferences**
   * Make sure the screenshot shows that **Free Tier usage alerts are enabled** and the **notification email** (if visible).








