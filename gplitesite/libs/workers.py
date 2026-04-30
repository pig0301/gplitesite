import os
from rq import Worker


class MaxJobsWorker(Worker):
    def __init__(self, *args, **kwargs):
        self.max_jobs = int(os.getenv('RQ_MAX_JOBS', 30))
        self.jobs_processed = 0
        super().__init__(*args, **kwargs)

    def perform_job(self, job, queue):
        rv = super().perform_job(job, queue)
        self.jobs_processed += 1
        
        if self.jobs_processed >= self.max_jobs:
            self.log.info(f"达到最大处理数 {self.max_jobs}，准备安全退出...")
            self.stop()
        
        return rv