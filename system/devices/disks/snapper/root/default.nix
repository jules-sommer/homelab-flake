{ ... }:
{
  services.snapper.configs.root = {
    SUBVOLUME = "/persist";
    TIMELINE_CREATE = true;
    TIMELINE_CLEANUP = true;
    TIMELINE_LIMIT_DAILY = 1;
    TIMELINE_LIMIT_WEEKLY = 0;
    TIMELINE_LIMIT_MONTHLY = 0;
    TIMELINE_LIMIT_YEARLY = 0;
  };
}
