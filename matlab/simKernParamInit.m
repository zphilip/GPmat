function kern = simKernParamInit(kern)
% SIMKERNPARAMINIT SIM kernel parameter initialisation.
% The single input motif (SIM) kernel is specifically designed for
% working with gene networks where there is assumed to be a single
% transcription factor controlling several genes. If each gene is
% related to the transcription factor through the following
% differential equation,
%
% dx(t)/dt = B + C f(t-delta) - D x(t),
%
% where D is a decay term, C is a response term, delta is a time delay
% and B is an initial level. Then if f(t) is assumed to come from a
% Gaussian process with an RBF covariance function x(t) is a Gaussian
% process with a covariance function provided by the single input
% motif kernel.
%
% The kernel is designed to interoperate with the multiple output
% block kernel so that f(t) can be inferred given several different
% instantiations of x(t) (associated with different genes).
%
% The parameters (B, C, delta and D) are constrained positive.
%
% FORMAT
% DESC initialises the single input motif
%  kernel structure with some default parameters.
% ARG kern : the kernel structure which requires initialisation.
% RETURN kern : the kernel structure with the default parameters placed in.
%
% SEEALSO : kernCreate, kernParamInit, simKernCompute
%
% COPYRIGHT : Neil D. Lawrence, 2006

% KERN

if kern.inputDimension > 1
  error('SIM kernel only valid for one-D input.')
end

kern.delay = 0;
kern.decay = 1;
kern.initVal = 1;
kern.variance = 1;
kern.inverseWidth = 1;
kern.nParams = 3;

kern.transforms.index = [1 2 3];
kern.transforms.type = 'negLogLogit';
