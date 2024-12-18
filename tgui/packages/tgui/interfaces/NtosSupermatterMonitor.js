import { NtosWindow } from '../layouts';
import { SupermatterMonitorContent } from './SupermatterMonitor';

export const NtosSupermatterMonitor = (props) => {
  return (
    <NtosWindow
      width={600}
      height={350}>
      <NtosWindow.Content scrollable>
        <SupermatterMonitorContent />
      </NtosWindow.Content>
    </NtosWindow>
  );
};
