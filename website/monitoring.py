from flask import Blueprint, Response, request
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST

monitoring = Blueprint("monitoring", __name__)

# Define metric
request_count = Counter(
    'request_count',
    'Total number of requests',
    ['method', 'endpoint', 'http_status']
)

# Middleware to increment counter
@monitoring.before_app_request
def before_request():
    # We don’t know status yet → will update after response
    request._prom_labels = {
        "method": request.method,
        "endpoint": request.path
    }

@monitoring.after_app_request
def after_request(response):
    labels = getattr(request, "_prom_labels", None)
    if labels:
        request_count.labels(
            method=labels["method"],
            endpoint=labels["endpoint"],
            http_status=response.status_code
        ).inc()
    return response

# Metrics endpoint
@monitoring.route("/metrics")
def metrics():
    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)
