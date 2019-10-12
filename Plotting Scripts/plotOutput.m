classdef plotOutput
    methods(Static)
        function [] = crossPlot(d34, d18, lables)
            f = figure
            set(f,'Units','normal','Position',[0.1 0.2 0.8 0.7])
            xlim([20 80])
            ylim([8 21])
            hold on

            l = 1
            plotNum = size(d34, 2)
            cc = jet(plotNum - 1)

            while l < plotNum
                plot(d34(:,l),d18(:,l), 'color', cc(l, :), 'DisplayName', sprintf('%0.5f %%',lables(1,l)))

                l = l +1
                pause(1);
            end

            while l == plotNum

                plot(d34(:,l),d18(:,l), 'k--', 'LineWidth', 2.0, 'DisplayName', 'Steady State');
                l = l + 1;

            end
            lgd = legend('location', 'southeast');
            lgd.Title.String = 'Percentage progress to steady-state';
            lgd.NumColumns = 2;
            xlabel('\delta^{34}S');
            ylabel('\delta^{18}O');
            title('Title');
        end

        function [] = depthPlot(d34, depth, lables)
            f = figure
            set(f,'Units','normal','Position',[0.1 0.2 0.8 0.7])
            xlim([20 80])
            ylim([0 1000])
            hold on

            l = 1
            plotNum = size(d34, 2)
            cc = jet(plotNum - 1)

            while l < plotNum
                %plot(d34(:,l),depth(:,1), 'color', cc(l, :), 'DisplayName', sprintf('%0.5f %%',lables(1,l)))
                plot(depth(:,1),d34(:,l), 'color', cc(l, :), 'DisplayName', sprintf('%0.5f %%',lables(1,l)))
                l = l +1
                pause(0.1);
            end

            while l == plotNum

                %plot(d34(:,l),depth(:,1), 'k--', 'LineWidth', 2.0, 'DisplayName', 'Steady State');
                plot(depth(:,1),d34(:,l), 'k--', 'LineWidth', 2.0, 'DisplayName', 'Steady State');
                l = l + 1;

            end
            lgd = legend('location', 'southeast');
            lgd.Title.String = 'Percentage progress to steady-state';
            lgd.NumColumns = 2;
            xlabel('\delta^{34}S');
            ylabel('depth / cm');
            title('Title');
        end
    end
end
