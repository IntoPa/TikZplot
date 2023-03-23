%     TikZPlot
%     Copyright (C) 2023  Into Joonas Akseli Pääkkönen
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <https://www.gnu.org/licenses/>.
visible = 'on';
plotName = 'firstPlot';

xData = [-2*pi:0.01:2*pi;-2*pi:0.01:2*pi]';
yData = [cos(xData(:,1)),sin(xData(:,2))];

latexStyle = 'firstPlot.txt';
plotStyle =  'firstPlot.txt';
%colorStyle = 'firstPlot.txt';

plotSettings = parsePlotConfig(plotStyle);
latexSettings = parseLatexConfig(plotStyle);

figureWidth = latexSettings{2};
figureHeight = latexSettings{4};
aspectRatio = (figureHeight)/(figureWidth);

fig = figure('Units','inches',...
            'OuterPosition',[0 0 figureWidth figureHeight],...
            'PaperUnits','inches',...
            'PaperSize',[figureWidth figureHeight],...
            'PaperPosition',[0 0 figureWidth figureHeight],...
            'visible',visible);

ax = axes(fig,...
            'innerPosition',[(0.5+1/72)/7 (0.5+1/72)/5 (1-(0.5+2/72)/7) (1-(0.5+2/72)/5)],... % 0.5, 0.5 - 2mm, -0.5-4mm, 
            'box','on',...
            'LineWidth',2,...
            'XGrid','on',...
            'YGrid','on',...
            'GridColor',[0.8 0.8 0.8],...
            'GridAlpha',1,...
            'YTickLabel',[],...
            'XTickLabel',[]);

hold on;
plot(xData,yData,plotSettings{:})
saveas(fig,['./savedPlots/', plotName],'pdf')

