classdef plotOutput
    methods(Static)
        function [] = crossPlot(d34, d18, lables)
            xlim([20 150])
            ylim([8 21])
            hold on

            l = 1
            plotNum = size(d34, 2)
            cc = jet(plotNum - 1)

            plot(d34(:,l),d18(:,l), 'k-.', 'LineWidth', 2.0, 'DisplayName', 'Initial State');
            l = l + 1
            
            while l < plotNum 
                plot(d34(:,l),d18(:,l), 'color', cc(l, :), 'DisplayName', sprintf('%0.3f %%',lables(1,l)))

                l = l +1
            end

            while l == plotNum

                plot(d34(:,l),d18(:,l), 'k--', 'LineWidth', 2.0, 'DisplayName', 'Steady State');
                l = l + 1;

            end
            lgd = legend('location', 'bestoutside');
            lgd.Title.String = 'Percentage progress to steady-state';
            lgd.NumColumns = 2;
        end

        function [] = depthPlot(d34, depth, lables)
            xlim([20 80])
            ylim([0 1000])
            hold on

            l = 1
            plotNum = size(d34, 2)
            cc = jet(plotNum - 1)
            
            plot(d34(:,l),depth(:,l), 'k-.', 'LineWidth', 2.0, 'DisplayName', 'Initial State');
            l = l + 1

            while l < plotNum
                plot(d34(:,l),depth(:,1), 'color', cc(l, :), 'DisplayName', sprintf('%0.3f %%', lables(1,l)))
                l = l +1
            end

            while l == plotNum

                plot(d34(:,l),depth(:,1), 'k--', 'LineWidth', 2.0, 'DisplayName', 'Steady State');
                l = l + 1;

            end

            lgd = legend('location', 'bestoutside');
            lgd.Title.String = 'Percentage progress to steady-state';
            lgd.NumColumns = 2;
        end
    end
end
