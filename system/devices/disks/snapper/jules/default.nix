{ config, lib, ... }:
{
  services.snapper.configs.jules = lib.mkIf config.environment.persistence."/persist".enable {
    SUBVOLUME = "/persist/home/jules";
    TIMELINE_CREATE = true;
    TIMELINE_CLEANUP = true;
    TIMELINE_LIMIT_DAILY = 1;
    TIMELINE_LIMIT_WEEKLY = 1;
    TIMELINE_LIMIT_MONTHLY = 0;
    TIMELINE_LIMIT_YEARLY = 0;
  };
}
